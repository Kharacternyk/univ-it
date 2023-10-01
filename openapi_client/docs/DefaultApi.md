# swagger_client.DefaultApi

All URIs are relative to *http://localhost:8123*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_column**](DefaultApi.md#create_column) | **PUT** /databases/{databaseName}/tables/{tableIndex}/columns | 
[**create_database**](DefaultApi.md#create_database) | **PUT** /databases/{name} | 
[**create_row**](DefaultApi.md#create_row) | **PUT** /databases/{databaseName}/tables/{tableIndex}/rows | 
[**create_table**](DefaultApi.md#create_table) | **PUT** /databases/{name}/tables | 
[**delete_column**](DefaultApi.md#delete_column) | **DELETE** /databases/{databaseName}/tables/{tableIndex}/columns/{columnIndex} | 
[**delete_database**](DefaultApi.md#delete_database) | **DELETE** /databases/{name} | 
[**delete_table**](DefaultApi.md#delete_table) | **DELETE** /databases/{databaseName}/tables/{tableIndex} | 
[**get_cell**](DefaultApi.md#get_cell) | **GET** /databases/{databaseName}/tables/{tableIndex}/rows/{rowIndex}/cells/{cellIndex} | 
[**get_column**](DefaultApi.md#get_column) | **GET** /databases/{databaseName}/tables/{tableIndex}/columns/{columnIndex} | 
[**get_database**](DefaultApi.md#get_database) | **GET** /databases/{name} | 
[**get_table**](DefaultApi.md#get_table) | **GET** /databases/{databaseName}/tables/{tableIndex} | 
[**modify_cell**](DefaultApi.md#modify_cell) | **POST** /databases/{databaseName}/tables/{tableIndex}/rows/{rowIndex}/cells/{cellIndex} | 
[**modify_column**](DefaultApi.md#modify_column) | **POST** /databases/{databaseName}/tables/{tableIndex}/columns/{columnIndex} | 
[**modify_database**](DefaultApi.md#modify_database) | **POST** /databases/{name} | 
[**modify_table**](DefaultApi.md#modify_table) | **POST** /databases/{databaseName}/tables/{tableIndex} | 

# **create_column**
> InlineResponse2001 create_column(database_name, table_index, body=body)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 
body = swagger_client.TableIndexColumnsBody() # TableIndexColumnsBody |  (optional)

try:
    api_response = api_instance.create_column(database_name, table_index, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->create_column: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 
 **body** | [**TableIndexColumnsBody**](TableIndexColumnsBody.md)|  | [optional] 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_database**
> create_database(name)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
name = 'name_example' # str | 

try:
    api_instance.create_database(name)
except ApiException as e:
    print("Exception when calling DefaultApi->create_database: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **str**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_row**
> InlineResponse2001 create_row(database_name, table_index)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 

try:
    api_response = api_instance.create_row(database_name, table_index)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->create_row: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_table**
> InlineResponse2001 create_table(name)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
name = 'name_example' # str | 

try:
    api_response = api_instance.create_table(name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->create_table: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **str**|  | 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_column**
> delete_column(database_name, table_index, column_index)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 
column_index = 56 # int | 

try:
    api_instance.delete_column(database_name, table_index, column_index)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_column: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 
 **column_index** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_database**
> delete_database(name)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
name = 'name_example' # str | 

try:
    api_instance.delete_database(name)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_database: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **str**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_table**
> delete_table(database_name, table_index)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 

try:
    api_instance.delete_table(database_name, table_index)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_table: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_cell**
> object get_cell(database_name, table_index, row_index, cell_index)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 
row_index = 56 # int | 
cell_index = 56 # int | 

try:
    api_response = api_instance.get_cell(database_name, table_index, row_index, cell_index)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_cell: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 
 **row_index** | **int**|  | 
 **cell_index** | **int**|  | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_column**
> DatabasesnameColumns get_column(database_name, table_index, column_index)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 
column_index = 56 # int | 

try:
    api_response = api_instance.get_column(database_name, table_index, column_index)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_column: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 
 **column_index** | **int**|  | 

### Return type

[**DatabasesnameColumns**](DatabasesnameColumns.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_database**
> list[InlineResponse200] get_database(name)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
name = 'name_example' # str | 

try:
    api_response = api_instance.get_database(name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_database: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **str**|  | 

### Return type

[**list[InlineResponse200]**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_table**
> InlineResponse2002 get_table(database_name, table_index)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 

try:
    api_response = api_instance.get_table(database_name, table_index)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_table: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **modify_cell**
> modify_cell(database_name, table_index, row_index, cell_index, body=body)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 
row_index = 56 # int | 
cell_index = 56 # int | 
body = NULL # object |  (optional)

try:
    api_instance.modify_cell(database_name, table_index, row_index, cell_index, body=body)
except ApiException as e:
    print("Exception when calling DefaultApi->modify_cell: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 
 **row_index** | **int**|  | 
 **cell_index** | **int**|  | 
 **body** | [**object**](object.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **modify_column**
> modify_column(database_name, table_index, column_index, body=body)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 
column_index = 56 # int | 
body = swagger_client.ColumnsColumnIndexBody() # ColumnsColumnIndexBody |  (optional)

try:
    api_instance.modify_column(database_name, table_index, column_index, body=body)
except ApiException as e:
    print("Exception when calling DefaultApi->modify_column: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 
 **column_index** | **int**|  | 
 **body** | [**ColumnsColumnIndexBody**](ColumnsColumnIndexBody.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **modify_database**
> modify_database(name, body=body)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
name = 'name_example' # str | 
body = swagger_client.DatabasesNameBody() # DatabasesNameBody |  (optional)

try:
    api_instance.modify_database(name, body=body)
except ApiException as e:
    print("Exception when calling DefaultApi->modify_database: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **str**|  | 
 **body** | [**DatabasesNameBody**](DatabasesNameBody.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **modify_table**
> modify_table(database_name, table_index, body=body)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
database_name = 'database_name_example' # str | 
table_index = 56 # int | 
body = swagger_client.TablesTableIndexBody() # TablesTableIndexBody |  (optional)

try:
    api_instance.modify_table(database_name, table_index, body=body)
except ApiException as e:
    print("Exception when calling DefaultApi->modify_table: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **database_name** | **str**|  | 
 **table_index** | **int**|  | 
 **body** | [**TablesTableIndexBody**](TablesTableIndexBody.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

