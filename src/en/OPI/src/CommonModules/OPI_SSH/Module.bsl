// OneScript: ./OInt/core/Modules/OPI_SSH.os
// Lib: SSH
// CLI: ssh
// Keywords: ssh, shell

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

#Region Public

#Region CommonMethods

// Create connection !NOCLI
// Creates a new SSH session
//
// Note:
// Get the connection configuration using the functions `GetSettingsLoginPassword`,^^
// `GetSettingsPrivateKey`, `GetSettingsViaAgent`
//
// Parameters:
// SSHSettings - Structure Of KeyAndValue - Connection settings structure - set
// Proxy - Structure Of KeyAndValue - Proxy settings structure, if necessary - proxy
//
// Returns:
// Arbitrary, Map of KeyAndValue - Create connection
Function CreateConnection(Val SSHSettings, Val Proxy = "") Export

    Return OPI_SSHRequests.CreateConnection(SSHSettings, Proxy);

EndFunction

// Get connection configuration
// Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions
//
// Note:
// Can be passed as the `Connection` parameter in other functions instead of the actual connection from the `CreateConnection` function.^^
// At the same time, a new connection will be opened and closed within the called function
// It is not recommended to use the connection configuration for multiple requests to the SSH server.^^
// This functionality is primarily intended for the CLI version of OInt, where maintaining a connection between calls is not possible
//
// Parameters:
// SSHSettings - Structure Of KeyAndValue - SSH settings - set
// Proxy - Structure Of KeyAndValue - Proxy settings, if required. See GetProxySettings - proxy
//
// Returns:
// Structure Of KeyAndValue - Connection settings structure
Function GetConnectionConfiguration(Val SSHSettings, Val Proxy = Undefined) Export

    Return OPI_SSHRequests.GetConnectionConfiguration(SSHSettings, Proxy);

EndFunction

// Execute command
// Executes the specified command
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Command - String - Command text - comm
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ExecuteCommand(Val Connection, Val Command) Export

    Return OPI_SSHRequests.ExecuteCommand(Connection, Command);

EndFunction

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - conn
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
Function CloseConnection(Val Connection) Export

    Return OPI_SSHRequests.CloseConnection(Connection);

EndFunction

// Is connector !NOCLI
// Checks that the value is an object of an external component for working with SSH
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return OPI_SSHRequests.IsConnector(Value);

EndFunction

// Get settings (login/password)
// Gets connection settings with login and password authentication
//
// Parameters:
// Host - String - SSH host - host
// Port - Number - SSH port - port
// Login - String - SSH username - user
// Password - String - SSH user password - pass
//
// Returns:
// Structure Of KeyAndValue - Connection configuration
Function GetSettingsLoginPassword(Val Host, Val Port, Val Login, Val Password = "") Export

    Return OPI_SSHRequests.GetSettingsLoginPassword(Host, Port, Login, Password);

EndFunction

// Get settings (private key)
// Gets connection settings with private key authentication
//
// Parameters:
// Host - String - SSH host - host
// Port - Number - SSH port - port
// Login - String - SSH username - user
// Private - String - Path to private key file - key
// Public - String - Path to public key file - pub
// Password - String - Private key password (passphrase) - pass
//
// Returns:
// Structure Of KeyAndValue - Connection configuration
Function GetSettingsPrivateKey(Val Host
    , Val Port
    , Val Login
    , Val Private
    , Val Public = ""
    , Val Password = "") Export

    Return OPI_SSHRequests.GetSettingsPrivateKey(Host, Port, Login, Private, Public, Password);

EndFunction

// Get settings (via agent)
// Gets connection settings with SSH Agent authentication
//
// Parameters:
// Host - String - SSH host - host
// Port - Number - SSH port - port
// Login - String - SSH username - user
//
// Returns:
// Structure Of KeyAndValue - Connection configuration
Function GetSettingsViaAgent(Val Host, Val Port, Val Login) Export

    Return OPI_SSHRequests.GetSettingsViaAgent(Host, Port, Login);

EndFunction

// Get proxy settings
// Creates a structure of proxy server settings for the connection
//
// Parameters:
// Address - String - Proxy address - addr
// Port - Number - Proxy port - port
// View - String - Proxy type: socks5, socks4, http - type
// Login - String, Undefined - Authorization login, if required - login
// Password - String, Undefined - Authorization password, if required - pass
//
// Returns:
// Structure Of KeyAndValue - Proxy settings structure
Function GetProxySettings(Val Address
    , Val Port
    , Val View = "socks5"
    , Val Login = Undefined
    , Val Password = Undefined) Export

    Return OPI_SSHRequests.GetProxySettings(Address, Port, View, Login, Password);

EndFunction

#EndRegion

#EndRegion
