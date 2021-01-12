namespace java com.rbkmoney.damsel.dominant.cache
namespace erlang dominant_cache

include "base.thrift"
include "domain.thrift"
include "msgpack.thrift"

typedef string CategoryRef
typedef string CategoryName
typedef string CategoryDescription

enum CategoryType {
    test
    live
}

typedef string DocumentTypeRef
typedef string DocumentTypeName
typedef string DocumentTypeDescription

typedef string CashRegisterProviderRef
typedef string CashRegisterProviderName
typedef string CashRegisterProviderDescription

typedef string CashRegisterProviderParameterId
typedef string CashRegisterProviderParameterDescription
typedef bool CashRegisterProviderIsRequired

typedef string CashRegisterProviderProxyRef
typedef map<string, string> CashRegisterProviderProxyOptions

enum CashRegisterProviderParameterType {
    stringType
    integerType
    urlType
    passwordType
}

struct CashRegisterProviderParameter {
    1: required CashRegisterProviderParameterId id
    2: optional CashRegisterProviderParameterDescription description
    3: optional CashRegisterProviderParameterType type
    4: required CashRegisterProviderIsRequired isRequired
}

struct CashRegisterProviderProxy {
    1: required CashRegisterProviderProxyRef ref
    2: optional CashRegisterProviderProxyOptions options
}


struct Category {
    1: required CategoryRef ref
    2: required CategoryName name
    3: optional CategoryDescription description
    4: required CategoryType type
}

struct DocumentType {
    1: required DocumentTypeRef ref
    2: required DocumentTypeName name
    3: optional DocumentTypeDescription description
}

struct CashRegisterProvider {
    1: required CashRegisterProviderRef ref
    2: required CashRegisterProviderName name
    3: optional CashRegisterProviderDescription description
    4: required CashRegisterProviderParameter parameter
    5: required CashRegisterProviderProxy proxy
}

service DominantCache {

        list<Category> GetCategories ()

        list<DocumentType> GetDocumentTypes ()

        list<CashRegisterProvider> GetCashRegisterProviders ()

}
