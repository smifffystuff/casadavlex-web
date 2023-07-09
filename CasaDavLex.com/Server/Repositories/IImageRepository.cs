namespace CasaDavLex.com.Server.Repositories
{
    public interface IImageRepository
    {
        Task<IEnumerable<string>> GetAllAsync();
        Task<string?> GetAsync(string FileName);
    }
}