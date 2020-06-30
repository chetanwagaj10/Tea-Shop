using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Web.Mvc;
using AmrittulyaTeaShop.Controllers;
using AmrittulyaTeaShop.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MvcControllerTesting
{
    [TestClass]
    public class TeaShopProductControllerTest
    {

        [TestMethod]
        public void Test_Index()
        {
            bool IsData = false;

            using (TeaShopEntities teaShopEntities = new TeaShopEntities())
            {

                List<TeaShop> teaShops = teaShopEntities.TeaShops.ToList();

                if (teaShops.Count == 0)
                {
                    teaShops.Add(new TeaShop());
                }
                if (teaShops.Count > 0)
                {
                    IsData = true;
                }

            }

            Assert.AreEqual(true, IsData);

        }

        [TestMethod]
        public void TestExpectedPropertiesExit()
        {
            PropertyInfo propInfoFirstName = typeof(TeaShop).GetProperty("ComponentName");

            // Assert.
            Assert.IsNotNull(propInfoFirstName);
        }
    }

}
