// Shared dictionary step for agents that commit BSL.
// DictionariesMethods.os adds new Russian keys with empty English values and exits 111.
// translate() fills only those empty values. A later build stops on 111 before it rewrites mirrors.

def fill(translate) {
    def dict = bat(script: 'oscript ./ci/os/internal/Classes/DictionariesMethods.os', returnStatus: true)
    if (dict == 111) {
        def translated = translate.call()
        if (translated != 0) {
            return -translated
        }
        dict = bat(script: 'oscript ./ci/os/internal/Classes/DictionariesMethods.os', returnStatus: true)
    }
    return dict
}

return this
