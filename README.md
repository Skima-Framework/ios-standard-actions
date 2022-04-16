The Standard Actions Library contains a bunch of basic Actions that are enough to create simple applications.

# Installation

```bash title="Podfile"
pod 'SkimaStandardActions'
```

# Registration

```js title="AppDelegate.swift"
import Skima
import SkimaStandardActions

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ActionsEngine.shared.registerOrReplace(SkimaStandardActions.self)
    return true
}
```

## Navigation

#### Type
`navigation`

#### Data
* **type** (string): `deep_link`, `endpoint`, `back`
* **value** (string)
    * If `deep_link` then the value is the deeplink to navigate to, eg. `skima://home`
    * If `endpoint` then the value is the URL to request the contract of the new screen.
    * If `back` then the value is empty.

#### Example
```json title="Action"
{
    "type": "navigation",
    "data": {
        "type": "endpoint",
        "value": "https://run.mocky.io/v3/f960b018-feca-4860-bcaf-b31b66bd95b7"
    }
}
```

## Apicall

#### Type
`apicall`

#### Data
* **method** (string): `get`, `post`, `put`, `delete`
* **endpoint** (string)
* **body** ([string]): Array of variablesId which values will be sent in the body of the request.

#### Example
```json title="Action"
{
    "type": "apicall",
    "data": {
        "type": "post",
        "endpoint": "https://example.com/user",
        "body": ["name", "last_name"]
    }
}
```

## ManageValue

#### Type
`manageValue`

#### Data
* **type** (string): `createOrModify`, `createIfNotExists`, `modifyIfExists`, `remove`
* **id** (string): Identifier of the variable to manage.
* **mode** (string): `memory`, `storage`, `encrypted` 
* **dataType** (string): `string`, `integer`, `double`, `boolean`
* **value** (string)

#### Example
```json title="Action"
{
    "type": "manageValue",
    "data": {
        "type": "createOrModify",
        "id": "best_framework",
        "dataType": "string",
        "value": "skima"
    }
}
```

:::caution
**mode** is not implemented yet and the only **dataType** in use is `string`.
:::
