using System;
using System.Collections.Generic;

namespace LoginWebRestApi.Models;

public partial class Area
{
    public int Aid { get; set; }

    public string? Name { get; set; }

    public string? Pincode { get; set; }

    public int? Cityid { get; set; }

    public virtual City? City { get; set; }

    public virtual ICollection<Patient> Patients { get; set; } = new List<Patient>();
}
