package Logica;

import Persistencia.ControladoraPersistencia;
import java.util.List;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void altaAdmin() {
        Usuario usur = new Usuario();
        usur.setApellido("Admin");
        usur.setUsuario("admin");
        usur.setPassword("admin");
        controlPersis.crearUsuario(usur);
    }

    public void crearUsuario(Usuario usur) {
        controlPersis.crearUsuario(usur);
    }

    public void crearHuesped(Huesped huesp) {
        controlPersis.crearHuesped(huesp);
    }

    public void crearHabitacion(Habitacion habit) {
        controlPersis.crearHabitacion(habit);
    }

    public List<Usuario> traerUsuario() {
        return controlPersis.traerUsuario();
    }

    public List<Huesped> traerHuesped() {
        return controlPersis.traerHuesped();
    }

    public List<Habitacion> traerHabitacion() {
        return controlPersis.traerHabitacion();
    }

    public Usuario buscarEmpleado(int id_empleado) {
        return controlPersis.buscarEmpleado(id_empleado);
    }

    public void altaUsuario(Usuario usur) {
        controlPersis.altaUsuario(usur);
    }

    public boolean buscarAdmin() {
        return controlPersis.buscarAdmin();
    }

    public boolean verificarLogin(String usuario, String password) {
        List<Usuario> listaUsuarios = controlPersis.traerUsuario();
        if (listaUsuarios != null) {
            for (int i = 0; i < listaUsuarios.size(); i++) {
                Usuario usu = listaUsuarios.get(i);
                if (usu.getUsuario().equals(usuario) && usu.getPassword().equals(password)) {
                    return true;
                }
            }
        }
        return false;
    }

    public Huesped buscarHuesped(int id_huesped) {
        return controlPersis.buscarHuesped(id_huesped);
    }

    public void modifHuesped(Huesped huesp) {
        controlPersis.modifHuesped(huesp);
    }

    public Habitacion buscarHabitacion(int id_habitacion) {
        return controlPersis.buscarHabitacion(id_habitacion);
    }

    public void modifHabitacion(Habitacion habit) {
        controlPersis.modifHabitacion(habit);
    }

    public void crearReserva(Reserva reser) {
        controlPersis.crearReserva(reser);
    }

    public List<Reserva> traerReserva() {
        return controlPersis.traerReserva();
    }

    public Reserva buscarReserva(int id_reserva) {
        return controlPersis.buscarReserva(id_reserva);
    }

    public void modifReserva(Reserva reser) {
        controlPersis.modifREseerva(reser);
    }

    public void borrarReserva(int id) {
        controlPersis.borrarReserva(id);
    }

    public void borrarUsuario(int id) {
        controlPersis.borrarUsuario(id);
    }

    public void borrarHuesped(int id) {
        controlPersis.borrarHuesped(id);
    }

    public void borrarHabitacion(int id) {
        controlPersis.borrarHabitacion(id);
    }
}
