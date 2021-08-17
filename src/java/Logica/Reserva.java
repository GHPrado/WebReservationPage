/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author horacio
 */
@Entity
public class Reserva implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int id_reserva;
    @Basic
    @Temporal(javax.persistence.TemporalType.DATE)
    Date fechaDesde;
    @Temporal(javax.persistence.TemporalType.DATE)
    Date fechaHasta;
    @OneToOne
    Habitacion habitacion;
    @OneToOne
    Huesped huesped;
    @OneToOne
    Usuario usuario;

    public Reserva() {
    }

    public Reserva(int id_reserva, Date fechaDesde, Date fechaHasta, Habitacion habitacion, Huesped huesped, Usuario usuario) {
        this.id_reserva = id_reserva;
        this.fechaDesde = fechaDesde;
        this.fechaHasta = fechaHasta;
        this.habitacion = habitacion;
        this.huesped = huesped;
        this.usuario = usuario;
    }

    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public Date getFechaDesde() {
        return fechaDesde;
    }

    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public Date getFechaHasta() {
        return fechaHasta;
    }

    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }

    public Habitacion getHabitacion() {
        return habitacion;
    }

    public void setHabitacion(Habitacion habitacion) {
        this.habitacion = habitacion;
    }

    public Huesped getHuesped() {
        return huesped;
    }

    public void setHuesped(Huesped huesped) {
        this.huesped = huesped;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

}
