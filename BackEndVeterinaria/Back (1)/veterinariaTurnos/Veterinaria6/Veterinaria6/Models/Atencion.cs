﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Veterinaria6.Models;

public partial class Atencion
{
    public int CodAtencion { get; set; }

    public int CodDisponibilidad { get; set; }

    public int CodMascota { get; set; }

    public virtual Disponibilidad CodDisponibilidadNavigation { get; set; }

    public virtual Mascotum CodMascotaNavigation { get; set; }

    public virtual ICollection<DetalleAtencion> DetalleAtencions { get; set; } = new List<DetalleAtencion>();
}