﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Veterinaria6.Models;

public partial class TipoAtencion
{
    public int CodTipoA { get; set; }

    public string Descripcion { get; set; }

    public virtual ICollection<DetalleAtencion> DetalleAtencions { get; set; } = new List<DetalleAtencion>();
}