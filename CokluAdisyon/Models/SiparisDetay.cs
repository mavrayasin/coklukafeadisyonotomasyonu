//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CokluAdisyon.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SiparisDetay
    {
        public int SiparisDetayID { get; set; }
        public int Siparis_ID { get; set; }
        public int Urun_ID { get; set; }
        public int Adet { get; set; }
    
        public virtual Siparis Siparis { get; set; }
        public virtual Urun Urun { get; set; }
    }
}
