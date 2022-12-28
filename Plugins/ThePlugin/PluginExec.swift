import PackagePlugin

@main
struct PluginExec: BuildToolPlugin {

    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let directory = context.pluginWorkDirectory
        let executable = try context.tool(named: "PluginExec")

        
        
        return [
            .prebuildCommand(
                displayName: "Generate licenses.json \(target.recursiveTargetDependencies)",
                executable: executable.path,
                arguments: [],
                outputFilesDirectory: directory)
        ]
    }

}


#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension PluginExec: XcodeBuildToolPlugin {
    
    // git diff --quiet && echo 'clean' || echo 'dirty'
    
    func createBuildCommands(context: XcodeProjectPlugin.XcodePluginContext, target: XcodeProjectPlugin.XcodeTarget) throws -> [PackagePlugin.Command] {
        let directory = context.pluginWorkDirectory
        let ls = try context.tool(named: "ls")
        let git = try context.tool(named: "git")
        let date = try context.tool(named: "date")
        
        print(context.pluginWorkDirectory)
        
        // /Users/damian/Library/Developer/Xcode/DerivedData/CodingChallenge-ghfbjdhewteeaefzzfqzrqndkqrl/SourcePackages/plugins/CodingChallenge.output/CodingChallenge/ThePlugin
        // /Users/damian/Library/Developer/Xcode/DerivedData/CodingChallenge-ghfbjdhewteeaefzzfqzrqndkqrl/SourcePackages/checkouts

        return [
            .prebuildCommand(
                displayName: "GenerateXcode licenses.json",
                executable: ls.path,
                arguments: [
                    "."
                ],
                workingDirectory: context.xcodeProject.directory,
                outputFilesDirectory: directory)
        ]
    }

}

#endif


//            .prebuildCommand(
//                displayName: "Time marking",
//                executable: date.path,
//                arguments: [
//                "+%s"
//                ],
//                outputFilesDirectory: directory
//            ),
//            .prebuildCommand(
//                displayName: "Git marking",
//                executable: git.path,
//                arguments: [
//                    "-C",
//                    context.xcodeProject.directory,
//                    "rev-parse",
//                    "--verify",
//                    "HEAD"
//                ],
//                environment: [
//                    :
////                    "GIT_DIR" : context.xcodeProject.directory
//                ],
//                outputFilesDirectory: directory
//            ),
