import AssertDiffHelperCore

let helper = AssertDiffHelper()

do {
    try helper.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
