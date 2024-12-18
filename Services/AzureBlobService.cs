using Azure.Storage.Blobs;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Threading.Tasks;
namespace NextStop.Services;


public class AzureBlobService
{
    private readonly string _connectionString;
    private readonly string _containerName;

    public AzureBlobService(IConfiguration configuration)
    {
        _connectionString = configuration.GetValue<string>("AzureBlobStorage:ConnectionString");
        _containerName = configuration.GetValue<string>("AzureBlobStorage:ContainerName");
    }

    public async Task<string> UploadProfilePictureAsync(IFormFile file)
    {
        var blobServiceClient = new BlobServiceClient(_connectionString);
        var containerClient = blobServiceClient.GetBlobContainerClient(_containerName);
        
        var fileName = Guid.NewGuid().ToString() + ".jpg";
        var blobClient = containerClient.GetBlobClient(fileName);
        
        await blobClient.UploadAsync(file.OpenReadStream(), overwrite: true); 
        
        return blobClient.Uri.AbsoluteUri; 
    }
}
