package libro.prestamo.Servicio;

import java.util.List;

import libro.prestamo.Tables.miembro;

// Esta es la interfaz que debe implementar la clase MiembroServiceImplementar
public interface MiembroServicio {

    public List<Miembro> ListaMiembros();

    public void addMiembro(Miembro miembro); // añadir

    public void deleteMiembro(Miembro miembro); // eliminar

    public Miembro findMiembro(Miembro miembro); // buscar
}
