package Persistencia;

import Logica.Habitacion;
import Logica.Huesped;
import Logica.Reserva;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    HabitacionJpaController habitJPA = new HabitacionJpaController();
    UsuarioJpaController usurJPA = new UsuarioJpaController();
    HuespedJpaController huespedJPA = new HuespedJpaController();
    ReservaJpaController reserJPA = new ReservaJpaController();

    public void crearUsuario(Usuario usur) {
        usurJPA.create(usur);
    }

    public List<Usuario> traerUsuario() {
        return usurJPA.findUsuarioEntities();
    }

    public void crearHuesped(Huesped huesp) {
        huespedJPA.create(huesp);
    }

    public List<Huesped> traerHuesped() {
        return huespedJPA.findHuespedEntities();
    }

    public void crearHabitacion(Habitacion habit) {
        habitJPA.create(habit);
    }

    public List<Habitacion> traerHabitacion() {
        return habitJPA.findHabitacionEntities();
    }

    public Usuario buscarEmpleado(int id_empleado) {
        return usurJPA.findUsuario(id_empleado);
    }

    public void altaUsuario(Usuario usur) {
        try {
            usurJPA.edit(usur);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean buscarAdmin() {

        boolean resultado = false;
        List<Usuario> usuarios = usurJPA.findUsuarioEntities();
        for (int i = 0; i < usuarios.size(); i++) {
            String apellido = usuarios.get(i).getApellido();
            if ("Admin".equals(apellido)) {
                resultado = true;
            }
        }
        return resultado;
    }

    public Huesped buscarHuesped(int id_huesped) {
        return huespedJPA.findHuesped(id_huesped);
    }

    public void modifHuesped(Huesped huesp) {
        try {
            huespedJPA.edit(huesp);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Habitacion buscarHabitacion(int id_habitacion) {
        return habitJPA.findHabitacion(id_habitacion);
    }

    public void modifHabitacion(Habitacion habit) {
        try {
            habitJPA.edit(habit);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearReserva(Reserva reser) {
        reserJPA.create(reser);
    }

    public List<Reserva> traerReserva() {
        return reserJPA.findReservaEntities();
    }

    public Reserva buscarReserva(int id_reserva) {
        return reserJPA.findReserva(id_reserva);
    }

    public void modifREseerva(Reserva reser) {
        try {
            reserJPA.edit(reser);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarReserva(int id_reserva) {
        try {
            reserJPA.destroy(id_reserva);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarUsuario(int id) {
        try {
            usurJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarHuesped(int id) {
        try {
            huespedJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarHabitacion(int id) {
        try {
            habitJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
