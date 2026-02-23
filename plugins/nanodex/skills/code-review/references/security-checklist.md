# Security Review Checklist

## OWASP Top 10 (Adapted for Code Review)

### 1. Injection
- [ ] SQL queries use parameterized statements (no string concatenation)
- [ ] Shell commands avoid user-supplied input (or sanitize thoroughly)
- [ ] Template rendering escapes user content by default
- [ ] LDAP, XPath, and other query languages use safe APIs

### 2. Broken Authentication
- [ ] Passwords hashed with bcrypt/scrypt/argon2 (not MD5/SHA)
- [ ] Session tokens are cryptographically random and sufficiently long
- [ ] Failed login attempts are rate-limited
- [ ] Password reset tokens expire after use

### 3. Sensitive Data Exposure
- [ ] No secrets hardcoded in source code
- [ ] PII not logged in plaintext
- [ ] HTTPS enforced for all sensitive data transmission
- [ ] Sensitive data encrypted at rest where required

### 4. XML External Entities (XXE)
- [ ] XML parsers disable external entity processing
- [ ] YAML parsers use safe loading (no arbitrary object instantiation)

### 5. Broken Access Control
- [ ] Every endpoint checks authorization (not just authentication)
- [ ] No direct object references without ownership verification
- [ ] Admin functions restricted to admin roles
- [ ] File uploads validated and sandboxed

### 6. Security Misconfiguration
- [ ] Debug mode disabled in production
- [ ] Error messages don't leak stack traces or internal paths
- [ ] Default credentials changed
- [ ] Unnecessary features and endpoints disabled

### 7. Cross-Site Scripting (XSS)
- [ ] User input escaped before rendering in HTML
- [ ] Content-Security-Policy headers configured
- [ ] `dangerouslySetInnerHTML` (React) or equivalent used only with sanitized content
- [ ] URL parameters not reflected without encoding

### 8. Insecure Deserialization
- [ ] No `eval()`, `pickle.loads()`, or `Marshal.load()` on untrusted data
- [ ] JSON.parse used instead of eval for JSON
- [ ] Object deserialization uses allowlists

### 9. Known Vulnerabilities
- [ ] Dependencies are up to date
- [ ] No dependencies with known CVEs in production path
- [ ] Lock files committed and reviewed

### 10. Insufficient Logging
- [ ] Authentication events logged (login, logout, failure)
- [ ] Authorization failures logged
- [ ] Input validation failures logged
- [ ] Logs don't contain sensitive data (passwords, tokens)
