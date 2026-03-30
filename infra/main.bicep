param location string = resourceGroup().location

// Azure Container Registry
resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: 'myregistry'
  location: location
  sku: { name: 'Basic' }
}

// Azure Container App (Staging + Production)
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'my-app'
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
  }
}
