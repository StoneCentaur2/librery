package libro.prestamo.Servicio;

import java.util.List;

import libro.prestamo.Tables.miembro;

// Esta es la interfaz que debe implementar la clase MiembroServiceImplementar
public interface MiembroServicio {

    public List<miembro> ListaMiembros();

    public void addMiembro(miembro miembro); // añadir

    public void deleteMiembro(miembro miembro); // eliminar

    public miembro findMiembro(miembro miembro); // buscar
}
