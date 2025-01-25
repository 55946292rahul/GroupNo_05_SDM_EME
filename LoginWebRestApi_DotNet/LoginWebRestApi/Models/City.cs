using System;
using System.Collections.Generic;

namespace LoginWebRestApi.Models;

public partial class City
{
    public int Cid { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Area> Areas { get; set; } = new List<Area>();
}
