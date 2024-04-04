{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_esBisiesto (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/usuario/repos/pdep/2024-f-bisiestoBase/.stack-work/install/x86_64-linux/40682d9701e2736682a9bb37f50e51d00be1f33763766c9b33665d935f1a4a9b/9.6.4/bin"
libdir     = "/home/usuario/repos/pdep/2024-f-bisiestoBase/.stack-work/install/x86_64-linux/40682d9701e2736682a9bb37f50e51d00be1f33763766c9b33665d935f1a4a9b/9.6.4/lib/x86_64-linux-ghc-9.6.4/esBisiesto-0.1.0.0-ItX2HfQiAuV70fc1DoV44e"
dynlibdir  = "/home/usuario/repos/pdep/2024-f-bisiestoBase/.stack-work/install/x86_64-linux/40682d9701e2736682a9bb37f50e51d00be1f33763766c9b33665d935f1a4a9b/9.6.4/lib/x86_64-linux-ghc-9.6.4"
datadir    = "/home/usuario/repos/pdep/2024-f-bisiestoBase/.stack-work/install/x86_64-linux/40682d9701e2736682a9bb37f50e51d00be1f33763766c9b33665d935f1a4a9b/9.6.4/share/x86_64-linux-ghc-9.6.4/esBisiesto-0.1.0.0"
libexecdir = "/home/usuario/repos/pdep/2024-f-bisiestoBase/.stack-work/install/x86_64-linux/40682d9701e2736682a9bb37f50e51d00be1f33763766c9b33665d935f1a4a9b/9.6.4/libexec/x86_64-linux-ghc-9.6.4/esBisiesto-0.1.0.0"
sysconfdir = "/home/usuario/repos/pdep/2024-f-bisiestoBase/.stack-work/install/x86_64-linux/40682d9701e2736682a9bb37f50e51d00be1f33763766c9b33665d935f1a4a9b/9.6.4/etc"

getBinDir     = catchIO (getEnv "esBisiesto_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "esBisiesto_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "esBisiesto_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "esBisiesto_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "esBisiesto_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "esBisiesto_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'