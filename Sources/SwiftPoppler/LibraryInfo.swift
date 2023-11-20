import Foundation
import CxxPoppler

public struct LibraryInfo {
    public struct Version {
        public static var major: Int { Int(POPPLER_VERSION_MAJOR) }
        public static var minor: Int { Int(POPPLER_VERSION_MINOR) }
        public static var micro: Int { Int(POPPLER_VERSION_MICRO) }
    }
    
    public static var version: String { POPPLER_VERSION }
}
