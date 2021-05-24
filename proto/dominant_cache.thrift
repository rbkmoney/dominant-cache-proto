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

typedef string ContractTemplateRef
typedef string ContractTemplateName
typedef string ContractTemplateDescription
typedef string TermSetHierarchyRef
typedef string TradeBlockRef

enum CashRegisterProviderParameterType {
    string_type
    integer_type
    url_type
    password_type
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
    1: required ContractTemplateRef ref
    2: optional ContractTemplateName name
    3: required ContractTemplateDescription description
    4: required TermSetHierarchyRef terms_id
}


struct TradeBlock {
    1: required TradeBlockRef ref
    2: required string name
    3: optional string description
}

service DominantCache {

        list<Category> GetCategories ()

        list<DocumentType> GetDocumentTypes ()

        list<CashRegisterProvider> GetCashRegisterProviders ()

        list<ContractTemplate> GetContractTemplates ()

        list<TradeBlock> GetTradeBlocks ()

}
