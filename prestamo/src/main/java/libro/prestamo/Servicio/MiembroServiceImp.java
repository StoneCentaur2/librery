package libro.prestamo.Servicio;

import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import libro.prestamo.DAO.miembroDao;
import libro.prestamo.Tables.miembro;

import org.springframework.transaction.annotation.Transactional;

@Service
public class MiembroServiceImp implements MiembroServicio{
    
    @Autowired
    private miembroDao MiembroDao;

    @Override
    @Transactional(readOnly = true)
    public List<miembro> ListaMiembros() {
        // Implementación de la lista de miembros
        // Devuelve una lista de objetos Miembro
        return (List<miembro>) MiembroDao.findAll(); // Retono de lista con recasteo
    }

    @Override
    @Transactional
    public void addMiembro(miembro miembro) {
        // Implementación para agregar un miembro a la lista
        // Recibe un objeto Miembro y lo agrega a la lista
        MiembroDao.save(miembro);
    }

    @Override
    @Transactional
    public void deleteMiembro(miembro miembro) {
        // Implementación para eliminar un miembro de la lista
        // Recibe un objeto Miembro y lo elimina de la lista
        MiembroDao.delete(miembro);
    }

    @Override
    @Transactional(readOnly = true)
    public miembro findMiembro(miembro miembro) {
        // Implementación para buscar un miembro de la lista
        // Recibe un objeto Miembro y actualiza su información en la lista
        return MiembroDao.findById(miembro.getIdMiembro()).orElse(null); // Retorno el objeto Miembro o null si no lo encuentra
    }

}
