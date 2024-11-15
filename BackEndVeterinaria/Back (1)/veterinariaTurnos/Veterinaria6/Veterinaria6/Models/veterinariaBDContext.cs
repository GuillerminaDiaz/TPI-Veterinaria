﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Veterinaria6.Models;

public partial class veterinariaBDContext : DbContext
{
    public veterinariaBDContext(DbContextOptions<veterinariaBDContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Atencion> Atencions { get; set; }

    public virtual DbSet<Cliente> Clientes { get; set; }

    public virtual DbSet<DetalleAtencion> DetalleAtencions { get; set; }

    public virtual DbSet<Disponibilidad> Disponibilidads { get; set; }

    public virtual DbSet<Mascotum> Mascota { get; set; }

    public virtual DbSet<TipoAtencion> TipoAtencions { get; set; }

    public virtual DbSet<TipoMascotum> TipoMascota { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Atencion>(entity =>
        {
            entity.HasKey(e => e.CodAtencion).HasName("PK__ATENCION__6AC5F2D0A03F1600");

            entity.ToTable("ATENCION");

            entity.Property(e => e.CodAtencion).HasColumnName("cod_atencion");
            entity.Property(e => e.CodDisponibilidad).HasColumnName("cod_disponibilidad");
            entity.Property(e => e.CodMascota).HasColumnName("cod_mascota");

            entity.HasOne(d => d.CodDisponibilidadNavigation).WithMany(p => p.Atencions)
                .HasForeignKey(d => d.CodDisponibilidad)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ATENCION__cod_di__49C3F6B7");

            entity.HasOne(d => d.CodMascotaNavigation).WithMany(p => p.Atencions)
                .HasForeignKey(d => d.CodMascota)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ATENCION__cod_ma__4AB81AF0");
        });

        modelBuilder.Entity<Cliente>(entity =>
        {
            entity.HasKey(e => e.CodCliente).HasName("PK__CLIENTE__08ED61F3F329E779");

            entity.ToTable("CLIENTE");

            entity.Property(e => e.CodCliente).HasColumnName("cod_cliente");
            entity.Property(e => e.Apellido)
                .IsRequired()
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("apellido");
            entity.Property(e => e.Dni).HasColumnName("dni");
            entity.Property(e => e.Nombre)
                .IsRequired()
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("nombre");
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Telefono)
                .IsRequired()
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("telefono");
            entity.Property(e => e.Username)
                .IsRequired()
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("username");
        });

        modelBuilder.Entity<DetalleAtencion>(entity =>
        {
            entity.HasKey(e => e.CodDetalle).HasName("PK__DETALLE___03E666AE7EF7B1AC");

            entity.ToTable("DETALLE_ATENCION");

            entity.Property(e => e.CodDetalle).HasColumnName("cod_detalle");
            entity.Property(e => e.CodAtencion).HasColumnName("cod_atencion");
            entity.Property(e => e.CodTipoA).HasColumnName("cod_tipoA");

            entity.HasOne(d => d.CodAtencionNavigation).WithMany(p => p.DetalleAtencions)
                .HasForeignKey(d => d.CodAtencion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__DETALLE_A__cod_a__4CA06362");

            entity.HasOne(d => d.CodTipoANavigation).WithMany(p => p.DetalleAtencions)
                .HasForeignKey(d => d.CodTipoA)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__DETALLE_A__cod_t__4BAC3F29");
        });

        modelBuilder.Entity<Disponibilidad>(entity =>
        {
            entity.HasKey(e => e.CodDisponibilidad).HasName("PK__DISPONIB__2B7902695DA483AE");

            entity.ToTable("DISPONIBILIDAD");

            entity.HasIndex(e => new { e.Fecha, e.Hora }, "UQ__DISPONIB__56E71B4FB317858B").IsUnique();

            entity.HasIndex(e => e.Hora, "UQ__DISPONIB__7F3086DB9E6D653A").IsUnique();

            entity.HasIndex(e => e.Fecha, "UQ__DISPONIB__E11413224C53A9C4").IsUnique();

            entity.Property(e => e.CodDisponibilidad).HasColumnName("cod_disponibilidad");
            entity.Property(e => e.Fecha)
                .HasColumnType("datetime")
                .HasColumnName("fecha");
            entity.Property(e => e.Hora)
                .HasColumnType("time(5)")
                .HasColumnName("hora");
            entity.Property(e => e.Ocupada).HasColumnName("ocupada");
        });

        modelBuilder.Entity<Mascotum>(entity =>
        {
            entity.HasKey(e => e.CodMascota).HasName("PK__MASCOTA__6BC4D21D249DE9E3");

            entity.ToTable("MASCOTA");

            entity.Property(e => e.CodMascota).HasColumnName("cod_mascota");
            entity.Property(e => e.CodCliente).HasColumnName("cod_cliente");
            entity.Property(e => e.CodTipo).HasColumnName("cod_tipo");
            entity.Property(e => e.Edad).HasColumnName("edad");
            entity.Property(e => e.Eliminado).HasColumnName("eliminado");
            entity.Property(e => e.Nombre)
                .IsRequired()
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("nombre");

            entity.HasOne(d => d.CodClienteNavigation).WithMany(p => p.Mascota)
                .HasForeignKey(d => d.CodCliente)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MASCOTA__cod_cli__4D94879B");

            entity.HasOne(d => d.CodTipoNavigation).WithMany(p => p.Mascota)
                .HasForeignKey(d => d.CodTipo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MASCOTA__cod_tip__4E88ABD4");
        });

        modelBuilder.Entity<TipoAtencion>(entity =>
        {
            entity.HasKey(e => e.CodTipoA).HasName("PK__TIPO_ATE__A85295C98B6E3360");

            entity.ToTable("TIPO_ATENCION");

            entity.Property(e => e.CodTipoA).HasColumnName("cod_tipoA");
            entity.Property(e => e.Descripcion)
                .IsRequired()
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("descripcion");
        });

        modelBuilder.Entity<TipoMascotum>(entity =>
        {
            entity.HasKey(e => e.CodTipo).HasName("PK__TIPO_MAS__7C06900D10ADE4A1");

            entity.ToTable("TIPO_MASCOTA");

            entity.Property(e => e.CodTipo).HasColumnName("cod_tipo");
            entity.Property(e => e.Nombre)
                .IsRequired()
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("nombre");
        });
        modelBuilder.Entity<Atencion>().Navigation(e => e.CodMascotaNavigation).AutoInclude();
        modelBuilder.Entity<Atencion>().Navigation(e => e.CodDisponibilidadNavigation).AutoInclude();
        modelBuilder.Entity<Mascotum>().Navigation(e => e.CodClienteNavigation).AutoInclude();
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}