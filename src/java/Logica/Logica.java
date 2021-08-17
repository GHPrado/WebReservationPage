package Logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Logica {

    public Date String_Fecha(String fechaJSP) {
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date dateFecha = new Date();
        try {
            dateFecha = formato.parse(fechaJSP);
        } catch (ParseException ex) {
            Logger.getLogger(Logica.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dateFecha;
    }

    public String Date_String(Date fecha) {
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        String dateFecha;
        dateFecha = formato.format(fecha);
        return dateFecha;
    }

    public boolean Verificar_dispon(int habitacion, Date desde, Date hasta) {
        boolean disponibilidad = false;
        Controladora control = new Controladora();
        List<Reserva> listReserva = control.traerReserva();
        if (listReserva.size() > 0) {
            for (int i = 0; i < listReserva.size(); i++) {
                Date desdeReser = listReserva.get(i).getFechaDesde();
                Date hastaReser = listReserva.get(i).getFechaHasta();
                int habitReser = listReserva.get(i).getHabitacion().getId_habitacion();
                if (desde.after(hasta)||desde.equals(hasta)||desde.before(new Date())) {
                    disponibilidad = false;
                    break;
                } else {
                    if (habitacion == habitReser) {
                        if (desde.before(hastaReser) && hasta.after(desdeReser)) {
                            disponibilidad = false;
                            break;
                        } else {
                            disponibilidad = true;
                        }
                    } else {
                        disponibilidad = true;

                    }
                }
            }
        } else {
            disponibilidad = true;
        }
        return disponibilidad;
    }

    public boolean Verificar_diaActual(Date desde, Date hasta) {
        boolean ocupada;
        java.util.Date fecha = new Date();
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -1);
        ocupada = desde.before(fecha) && hasta.after(cal.getTime());
        return ocupada;
    }

    public boolean Verificar_ocupaHoy(Date desde) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String desdeSTR = sdf.format(desde);
        String hoySTR = sdf.format(new Date());
        return desdeSTR.equals(hoySTR);
    }
    
    
    public boolean Verificar_desocupaHoy(Date hasta) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String hastaSTR = sdf.format(hasta);
        String hoySTR = sdf.format(new Date());
        return hastaSTR.equals(hoySTR);
    }


        
    public boolean Verificar_reservaMes(String mesBuscar, Date desde, Date hasta) {

        SimpleDateFormat sdf = new SimpleDateFormat("MM/yyyy");
        String desdeSTR = sdf.format(desde);
        String hastaSTR = sdf.format(hasta);
        return (desdeSTR.equals(mesBuscar)||hastaSTR.equals(mesBuscar));
    }
}
