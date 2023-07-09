using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.DynamoDBv2.Model;
using CasaDavLex.com.Server.Settings;
using Microsoft.Extensions.Options;
using System.Net;

namespace CasaDavLex.com.Server.Repositories;

public class ImageRepository : IImageRepository
{

    private readonly IAmazonDynamoDB _dynamodb;
    private readonly IOptions<DatabaseSettings> _databaseSettings;

    public ImageRepository(IAmazonDynamoDB dynamodb, IOptions<DatabaseSettings> databaseSettings)
    {
        _dynamodb = dynamodb;
        _databaseSettings = databaseSettings;
    }

    public async Task<string?> GetAsync(string FileName)
    {
        //var request = new GetItemRequest
        //{
        //    TableName = _databaseSettings.Value.TableName,
        //    Key = new Dictionary<string, AttributeValue>
        //    {
        //        { "pk", new AttributeValue { S = id.ToString() } },
        //        { "sk", new AttributeValue { S = id.ToString() } }
        //    }
        //};

        //var response = await _dynamoDb.GetItemAsync(request);
        //if (response.Item.Count == 0)
        //{
        //    return null;
        //}

        //var itemAsDocument = Document.FromAttributeMap(response.Item);
        await Task.CompletedTask;
        return FileName;
    }

    public async Task<IEnumerable<string>> GetAllAsync()
    {
        var request = new ScanRequest
        {
            TableName = _databaseSettings.Value.ImagesTableName
        };

        var response = await _dynamodb.ScanAsync(request);

        var fileNames = new List<string>();

        foreach (var item  in response.Items) {
            fileNames.Add(item["FileName"].S);
        }
        


        return fileNames;
    }




}
