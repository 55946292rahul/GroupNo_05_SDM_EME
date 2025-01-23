using System;
using System.Collections.Generic;

namespace LoginWebRestApi.Models;

public partial class Role
{
    public int RId { get; set; }

    public string RName { get; set; } = null!;

    public virtual ICollection<Login> Logins { get; set; } = new List<Login>();
}
