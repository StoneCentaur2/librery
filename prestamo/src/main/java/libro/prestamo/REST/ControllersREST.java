package libro.prestamo.REST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import libro.prestamo.Tables.miembro;
import libro.prestamo.Servicio.MiembroService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ControllersREST {

    @Autowired
    private MiembroService miembroService;

    // CRUD para miembros
    //Metodos para manejar las peticiones GET y POST
    @GetMapping("/saludo")// get the controller for new start
    public String index() {
        return "Hola spring boot";
    }

    @GetMapping("/miembros") // ver lista de miembros
    public Iterable<miembro> getAllMiembros() {
        log.info("********** GET inciado ****************************");
        return MiembroService.ListaMiembros();
    }

    @GetMapping("/IngresarMiembros") // poder ingresar miembros
    public String IngresoLibros(Miembro miembro) {
        log.info("********** GET inciado ****************************");
        return "Miembros";
    }
    
    @PostMapping("/AddMiembros") // guardar un nuevo miembro
    public Miembro saveMiembro(Miembro miembro) {
        miembroService.addMiembro(miembro);
        log.info("********** POST inciado ****************************");
        return "redirect:/";
    }
}
