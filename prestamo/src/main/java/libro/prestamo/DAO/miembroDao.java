package libro.prestamo.DAO;

import org.springframework.data.repository.CrudRepository;

import libro.prestamo.Tables.miembro;

public interface miembroDao extends CrudRepository<miembro, Long> {

}
