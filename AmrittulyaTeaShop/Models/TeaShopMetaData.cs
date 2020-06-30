using System;
using System.ComponentModel.DataAnnotations;

namespace AmrittulyaTeaShop.Models
{
    [MetadataType(typeof(TeaShopMetaData))]
    public partial class TeaShop
    {

    }

    public class TeaShopMetaData
    {
        [Required]
        [Display(Name = "Component")]
        public string ComponentName { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        //[RegularExpression("([1-9][0-9]*)", ErrorMessage = "price must be a natural number")]
        [DisplayFormat(DataFormatString = "{0:C}", ApplyFormatInEditMode = true)]

        public Nullable<double> Price { get; set; }


        [Display(Name = "Upload Image")]

        public string Picture { get; set; }
    }
}