package libro.prestamo.REST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import libro.prestamo.DAO.miembroDao;
import libro.prestamo.Tables.miembro;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ControllersREST {

    @Autowired
    private miembroDao miembroD;

    // CRUD para miembros
    @GetMapping("/miembros")
    public Iterable<miembro> getAllMiembros() {
        log.info("********** GET inciado ****************************");
        return miembroD.findAll();
    }

    //Metodos para manejar las peticiones GET y POST
    @GetMapping("/saludo")// get the controller for new start
    public String index() {
        return "Hola spring boot";
    }
    @GetMapping("/IngresoLibros")
    public String IngresoLibros() {
        log.info("********** Index inciado ****************************");
        return index();
    }

    @PostMapping("/Post")
    public String post() {
        log.info("********** POST inciado ****************************");
        return "Post recibido";
    }

}
