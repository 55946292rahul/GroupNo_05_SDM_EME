using System;
using System.Collections.Generic;

namespace LoginWebRestApi.Models;

public partial class Login
{
    public int LoginId { get; set; }

    public string Username { get; set; } = null!;

    public string Pwd { get; set; } = null!;

    public int RId { get; set; }

    public string Status { get; set; } = null!;

    public virtual ICollection<Doctor>? Doctors { get; set; } = new List<Doctor>();

    public virtual ICollection<Patient>? Patients { get; set; } = new List<Patient>();

    public virtual Role RIdNavigation { get; set; } = null!;
}
