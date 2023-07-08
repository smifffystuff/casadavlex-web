using CasaDavLex.com.Client;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Blazorise;
using Blazorise.Bootstrap5;
using Blazorise.Icons.FontAwesome;
using Syncfusion.Blazor;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

Syncfusion.Licensing.SyncfusionLicenseProvider
    .RegisterLicense("MjEzMzg3OUAzMjMxMmUzMjJlMzNWZkcxVzVOUVE1OHZzd01UUHBhdlpRTlp1cnN3Ri9vT1dyVCtFemZvQldJPQ==;Mgo+DSMBaFt+QHJqVk1lQ1NMaV1CX2BZdllyR2lZeE4BCV5EYF5SRHNdQ11rTXxTcUdhUHc=;Mgo+DSMBMAY9C3t2VFhiQlJPc0BAVXxLflF1VWtTe1x6dFJWESFaRnZdQV1mS39TfkFhWXhcdHFd;Mgo+DSMBPh8sVXJ1S0R+X1pBaV1KQmFJfFBmTWldfVRwc0U3HVdTRHRcQlhhSH5bckdjXn1YcHw=;MjEzMzg4M0AzMjMxMmUzMjJlMzNjOTl6eDhScUsvMk1lK1BTYlVCT1Iyc3J5cUZraUFkWVpQUEZKWkNIZ0tVPQ==;NRAiBiAaIQQuGjN/V0d+Xk9HfVpdX2tWfFN0RnNRdVpyflVBcC0sT3RfQF5jTHxSdk1nW39Zcn1QTg==;ORg4AjUWIQA/Gnt2VFhiQlJPc0BAVXxLflF1VWtTe1x6dFJWESFaRnZdQV1mS39TfkFhWXhdcH1d;MjEzMzg4NkAzMjMxMmUzMjJlMzNrd3ZmYytnVWZXVStsU0F6UEJuWlBlcXhaQUpOdGxQRTQwTFIrWDFXblVjPQ==;MjEzMzg4N0AzMjMxMmUzMjJlMzNEeFloM0NpZVZtZlVKdU4xZGRYOFhFdTh5c2VKcDNObmFSYTBJa3ZuWGpzPQ==;MjEzMzg4OEAzMjMxMmUzMjJlMzNucEtjZXV4ZHFOY2UxdERBQ2hDeFJPWlhvQWxjU0FMdlJLamVIazFST3lnPQ==;MjEzMzg4OUAzMjMxMmUzMjJlMzNpS0lkTHVhaTJVZSt4YjBpVzdPQkNFdFhQZkJjTkhlb24yZ0lwY29hUVJJPQ==;MjEzMzg5MEAzMjMxMmUzMjJlMzNWZkcxVzVOUVE1OHZzd01UUHBhdlpRTlp1cnN3Ri9vT1dyVCtFemZvQldJPQ==");
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
builder.Services
    .AddBlazorise(options =>
    {
        options.Immediate = true;
    })
    .AddSyncfusionBlazor()
    .AddBootstrap5Providers()
    .AddFontAwesomeIcons();

await builder.Build().RunAsync();
