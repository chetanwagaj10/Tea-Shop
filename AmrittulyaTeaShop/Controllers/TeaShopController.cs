using AmrittulyaTeaShop.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace AmrittulyaTeaShop.Controllers
{
    public class TeaShopController : ApiController
    {
        public IEnumerable<TeaShop> GetComponent()
        {
            using (TeaShopEntities teaShopEntities = new TeaShopEntities())
            {
                return teaShopEntities.TeaShops.ToList();
            }
        }

        public HttpResponseMessage GetComponent(int id)
        {

            using (TeaShopEntities teaShopEntitiesDetails = new TeaShopEntities())
            {
                HttpResponseMessage message;

                TeaShop teaShopData = teaShopEntitiesDetails.TeaShops.FirstOrDefault(x => x.ComponentId == id);

                if (teaShopData != null)
                {
                    message = Request.CreateResponse(HttpStatusCode.OK, teaShopData);
                }
                else
                {
                    message = Request.CreateResponse(HttpStatusCode.NotFound, $"Id={id} is not found");
                }
                return message;

            }
        }


        [HttpPost]
        public HttpResponseMessage InsertComponent()
        {
            try
            {

                TeaShop teaShop = new TeaShop();

                using (TeaShopEntities teaShopEntities = new TeaShopEntities())
                {
                    string folderCreate = HttpContext.Current.Server.MapPath("~/Images/");

                    if (!Directory.Exists(folderCreate))
                    {
                        Directory.CreateDirectory(folderCreate);
                    }
                    if (HttpContext.Current.Request.Files.AllKeys.Any())
                    {
                        var fileUpload = HttpContext.Current.Request.Files["ImagePathSave"];

                        if (fileUpload != null)
                        {
                            string saveImage = Path.Combine(HttpContext.Current.Server.MapPath("~/Images/"), fileUpload.FileName);

                            var fileName = $"~/Images/{ fileUpload.FileName}";

                            fileUpload.SaveAs(saveImage);

                            teaShop.Picture = fileName;

                            teaShop.AlternateText = fileUpload.FileName;
                        }

                    }
                    var component = HttpContext.Current.Request.Params["Component"];

                    var description = HttpContext.Current.Request.Params["Description"];

                    string price = HttpContext.Current.Request.Params["Price"];

                    teaShop.ComponentName = component;

                    teaShop.Description = description;

                    double OutVal;

                    double.TryParse(price, out OutVal);

                    teaShop.Price = OutVal;

                    var entity = teaShopEntities.TeaShops.Add(teaShop);

                    teaShopEntities.SaveChanges();

                    var message = Request.CreateResponse(HttpStatusCode.Created);

                    return message;

                }
            }
            catch (Exception exception)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, exception);

            }
        }


        //Update Record
        [Route("api/TeaShop/UpdateComponent")]
        public HttpResponseMessage UpdateComponent(int id, [FromBody]TeaShop teaShop)
        {
            HttpResponseMessage message;
            try
            {
                using (TeaShopEntities teaShopEntities = new TeaShopEntities())
                {
                    var entity = teaShopEntities.TeaShops.FirstOrDefault(x => x.ComponentId == id);

                    if (entity == null)
                    {
                        message = Request.CreateErrorResponse(HttpStatusCode.NotFound, $"id{id} is not found to update");
                    }
                    else
                    {
                        entity.ComponentName = teaShop.ComponentName;

                        entity.Description = teaShop.Description;

                        entity.Price = teaShop.Price;

                        teaShopEntities.SaveChanges();

                        message = Request.CreateResponse(HttpStatusCode.OK);

                    }
                    return message;

                }
            }
            catch (Exception exception)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, exception);
            }
        }

        //Delete Record
        [HttpDelete]
        public HttpResponseMessage Delete(int id)
        {
            HttpResponseMessage message;
            try
            {
                using (TeaShopEntities teaShopEntities = new TeaShopEntities())
                {
                    var entity = teaShopEntities.TeaShops.FirstOrDefault(x => x.ComponentId == id);

                    if (entity == null)
                    {
                        message = Request.CreateResponse(HttpStatusCode.NotFound, $"Id ={id} is not found to delete");
                    }
                    else
                    {
                        teaShopEntities.TeaShops.Remove(entity);

                        teaShopEntities.SaveChanges();

                        message = Request.CreateResponse(HttpStatusCode.OK);

                    }
                    return message;
                }
            }
            catch (Exception exception)
            {

                return message = Request.CreateErrorResponse(HttpStatusCode.BadRequest, exception);
            }
        }
    }
}
