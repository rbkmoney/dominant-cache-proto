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

typedef string ContractTemplateName
typedef string ContractTemplateDescription
typedef string TermSetHierarchyRef

enum CashRegisterProviderParameterType {
    string_type
    integer_type
    url_type
    password_type
}

union Lifetime {
    1: base.Timestamp timestamp
    2: LifetimeInterval interval
}

struct LifetimeInterval {
    1: optional i16 years
    2: optional i16 months
    3: optional i16 days
    4: optional i16 hours
    5: optional i16 minutes
    6: optional i16 seconds
}

struct CashRegisterProviderParameter {
    1: required CashRegisterProviderParameterId id
    2: optional CashRegisterProviderParameterDescription description
    3: required CashRegisterProviderParameterType type
    4: required CashRegisterProviderIsRequired is_required
}

struct CashRegisterProviderProxy {
    1: required CashRegisterProviderProxyRef ref
    2: optional CashRegisterProviderProxyOptions options
}


struct Category {
    1: required CategoryRef ref
    2: required CategoryName name
    3: required CategoryDescription description
    4: optional CategoryType type
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
    4: required list<CashRegisterProviderParameter> parameter
    5: required CashRegisterProviderProxy proxy
}

struct ContractTemplate {
    1: optional ContractTemplateName name
    2: required ContractTemplateDescription description
    3: optional Lifetime valid_since
    4: optional Lifetime valid_until
    5: required TermSetHierarchyRef id
}

service DominantCache {

        list<Category> GetCategories ()

        list<DocumentType> GetDocumentTypes ()

        list<CashRegisterProvider> GetCashRegisterProviders ()

        list<ContractTemplate> GetContractTemplates ()

}
