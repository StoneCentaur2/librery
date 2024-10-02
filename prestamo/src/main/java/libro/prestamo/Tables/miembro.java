package libro.prestamo.Tables;

import java.io.Serializable;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "miembro")
public class miembro implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Generated(strategy = GenerationType.IDENTITY)
    private Long idMiembro;
    private String Nombre;
    private String Direccion;
    private int Telefono;
    private String Email;
    private String FechaRegistro;

}
