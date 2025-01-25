using System;
using System.Collections.Generic;

namespace LoginWebRestApi.Models;

public partial class Patient
{
    public int PatientId { get; set; }

    public string Fname { get; set; } = null!;

    public string Lname { get; set; } = null!;

    public string MobNo { get; set; } = null!;

    public string EmailAddress { get; set; } = null!;

    public string AadharNo { get; set; } = null!;

    public string PAddress { get; set; } = null!;

    public string Gender { get; set; } = null!;

    public string BloodGrp { get; set; } = null!;

    public DateOnly Dob { get; set; }

    public int Areaid { get; set; }

    public int Loginid { get; set; }

    public virtual Area Area { get; set; } = null!;

    public virtual Login Login { get; set; } = null!;
}