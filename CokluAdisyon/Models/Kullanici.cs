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
    
    public partial class Kullanici
    {
        public int KullaniciID { get; set; }
        public int Kafe_ID { get; set; }
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }
    
        public virtual Kafeler Kafeler { get; set; }
    }
}
