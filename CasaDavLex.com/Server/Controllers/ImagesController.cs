using CasaDavLex.com.Server.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace CasaDavLex.com.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImagesController : ControllerBase
    {
        private readonly IImageRepository _imageRepository;

        private readonly string _imageBaseUrl;

        public ImagesController(IImageRepository imageRepository, IConfiguration config)
        {
            _imageRepository = imageRepository;
            _imageBaseUrl = config.GetValue<string>("ImageSettings:BaseUrl") ?? "";
        }

        [HttpGet]
        public async Task<IEnumerable<string>> Get()
        {
            return (await _imageRepository.GetAllAsync()).Select( i => $"{_imageBaseUrl}{i}");
            
        }
    }
}
