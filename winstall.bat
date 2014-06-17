@echo off
mklink %USERPROFILE%\_vimrc %~dp0\vim
mklink /j %USERPROFILE%\.vim %~dp0\vimrc
mklink %USERPROFILE%\.hgrc %~dp0\hgrc
