using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Scaffolding.Internal;

namespace LoginWebRestApi.Models;

public partial class HospitalmanagementContext : DbContext
{
    public HospitalmanagementContext()
    {
    }

    public HospitalmanagementContext(DbContextOptions<HospitalmanagementContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Area> Areas { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<Doctor> Doctors { get; set; }

    public virtual DbSet<Efmigrationshistory> Efmigrationshistories { get; set; }

    public virtual DbSet<Login> Logins { get; set; }

    public virtual DbSet<Patient> Patients { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("server=localhost;port=3306;user=root;password=deven;database=hospitalmanagement", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.2.0-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Area>(entity =>
        {
            entity.HasKey(e => e.Aid).HasName("PRIMARY");

            entity.ToTable("area");

            entity.HasIndex(e => e.Cityid, "cityid_fk_idx");

            entity.Property(e => e.Aid).HasColumnName("aid");
            entity.Property(e => e.Cityid).HasColumnName("cityid");
            entity.Property(e => e.Name)
                .HasMaxLength(45)
                .HasColumnName("name");
            entity.Property(e => e.Pincode)
                .HasMaxLength(8)
                .HasColumnName("pincode");

            entity.HasOne(d => d.City).WithMany(p => p.Areas)
                .HasForeignKey(d => d.Cityid)
                .HasConstraintName("cityid_fk");
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.Cid).HasName("PRIMARY");

            entity.ToTable("city");

            entity.Property(e => e.Cid).HasColumnName("cid");
            entity.Property(e => e.Name)
                .HasMaxLength(45)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Department>(entity =>
        {
            entity.HasKey(e => e.DeptId).HasName("PRIMARY");

            entity.ToTable("department");

            entity.Property(e => e.DeptId)
                .ValueGeneratedNever()
                .HasColumnName("dept_id");
            entity.Property(e => e.DeptName)
                .HasMaxLength(45)
                .HasColumnName("dept_name");
        });

        modelBuilder.Entity<Doctor>(entity =>
        {
            entity.HasKey(e => e.DoctorId).HasName("PRIMARY");

            entity.ToTable("doctor");

            entity.HasIndex(e => e.DeptId, "deptfkey_idx");

            entity.HasIndex(e => e.LoginId, "loginfkey_idx");

            entity.HasIndex(e => e.RegistrationId, "registration_id_UNIQUE").IsUnique();

            entity.Property(e => e.DoctorId).HasColumnName("doctor_id");
            entity.Property(e => e.DAddress)
                .HasMaxLength(45)
                .HasColumnName("d_address");
            entity.Property(e => e.DeptId).HasColumnName("dept_id");
            entity.Property(e => e.DfName)
                .HasMaxLength(45)
                .HasColumnName("df_name");
            entity.Property(e => e.DlName)
                .HasMaxLength(45)
                .HasColumnName("dl_name");
            entity.Property(e => e.Doj).HasColumnName("DOJ");
            entity.Property(e => e.EmailId)
                .HasMaxLength(45)
                .HasColumnName("email_id");
            entity.Property(e => e.LoginId).HasColumnName("Login_id");
            entity.Property(e => e.MobileNo)
                .HasMaxLength(45)
                .HasColumnName("mobile_no");
            entity.Property(e => e.RegistrationId)
                .HasMaxLength(45)
                .HasColumnName("registration_id");
            entity.Property(e => e.Specialization).HasMaxLength(45);

            entity.HasOne(d => d.Dept).WithMany(p => p.Doctors)
                .HasForeignKey(d => d.DeptId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("deptfkey");

            entity.HasOne(d => d.Login).WithMany(p => p.Doctors)
                .HasForeignKey(d => d.LoginId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("loginfkey");
        });

        modelBuilder.Entity<Efmigrationshistory>(entity =>
        {
            entity.HasKey(e => e.MigrationId).HasName("PRIMARY");

            entity.ToTable("__efmigrationshistory");

            entity.Property(e => e.MigrationId).HasMaxLength(150);
            entity.Property(e => e.ProductVersion).HasMaxLength(32);
        });

        modelBuilder.Entity<Login>(entity =>
        {
            entity.HasKey(e => e.LoginId).HasName("PRIMARY");

            entity.ToTable("login");

            entity.HasIndex(e => e.RId, "rolefkey_idx");

            entity.Property(e => e.LoginId).HasColumnName("login_id");
            entity.Property(e => e.Pwd)
                .HasMaxLength(45)
                .HasColumnName("pwd");
            entity.Property(e => e.RId).HasColumnName("r_id");
            entity.Property(e => e.Status)
                .HasMaxLength(45)
                .HasColumnName("status");
            entity.Property(e => e.Username)
                .HasMaxLength(45)
                .HasColumnName("username");

            entity.HasOne(d => d.RIdNavigation).WithMany(p => p.Logins)
                .HasForeignKey(d => d.RId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("rolefkey");
        });

        modelBuilder.Entity<Patient>(entity =>
        {
            entity.HasKey(e => e.PatientId).HasName("PRIMARY");

            entity.ToTable("patient");

            entity.HasIndex(e => e.AadharNo, "aadhar_no_UNIQUE").IsUnique();

            entity.HasIndex(e => e.Areaid, "areaid_fk_idx");

            entity.HasIndex(e => e.EmailAddress, "email_address_UNIQUE").IsUnique();

            entity.HasIndex(e => e.Loginid, "loginid_fk_idx");

            entity.Property(e => e.PatientId).HasColumnName("patient_id");
            entity.Property(e => e.AadharNo)
                .HasMaxLength(45)
                .HasColumnName("aadhar_no");
            entity.Property(e => e.Areaid).HasColumnName("areaid");
            entity.Property(e => e.BloodGrp)
                .HasMaxLength(45)
                .HasColumnName("blood_grp");
            entity.Property(e => e.Dob).HasColumnName("dob");
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(45)
                .HasColumnName("email_address");
            entity.Property(e => e.Fname)
                .HasMaxLength(45)
                .HasColumnName("fname");
            entity.Property(e => e.Gender)
                .HasMaxLength(45)
                .HasColumnName("gender");
            entity.Property(e => e.Lname)
                .HasMaxLength(45)
                .HasColumnName("lname");
            entity.Property(e => e.Loginid).HasColumnName("loginid");
            entity.Property(e => e.MobNo)
                .HasMaxLength(10)
                .HasColumnName("mob_no");
            entity.Property(e => e.PAddress)
                .HasMaxLength(100)
                .HasColumnName("p_address");

            entity.HasOne(d => d.Area).WithMany(p => p.Patients)
                .HasForeignKey(d => d.Areaid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("areaid_fk");

            entity.HasOne(d => d.Login).WithMany(p => p.Patients)
                .HasForeignKey(d => d.Loginid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("loginid_fk");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RId).HasName("PRIMARY");

            entity.ToTable("role");

            entity.Property(e => e.RId)
                .ValueGeneratedNever()
                .HasColumnName("r_id");
            entity.Property(e => e.RName)
                .HasMaxLength(45)
                .HasColumnName("r_name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
