// Shared build for agents that commit BSL.
// OpiMain inside BigFloppa rewrites the OneScript and English mirrors from src/ru/BSL.
// OneScript tests read those mirrors, so a BSL edit is invisible until this build pushes.
// Empty dictionary values stop the build first: fill-dict.groovy must run before it.

def run() {
    return build(
        job: 'BigFloppa',
        wait: true,
        propagate: false,
        parameters: [
            [$class: 'StringParameterValue', name: 'BRANCH', value: env.ALPACA_BRANCH],
            [$class: 'StringParameterValue', name: 'ADDINS_BRANCH', value: env.ALPACA_ADDINS],
            [$class: 'BooleanParameterValue', name: 'UPLOAD_ARTIFACTS', value: false],
            [$class: 'BooleanParameterValue', name: 'SKIP_DB_UPDATE', value: true]
        ])
}

return this
