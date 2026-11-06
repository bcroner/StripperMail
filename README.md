# StripperMail

An open-source, high-performance, self-hosted mail server architecture designed to run seamlessly on bare-metal infrastructure via the **CloudStripper** engine.

Licensed under the permissive **MIT License**.

## Overview

StripperMail cuts out corporate reliance, webmail data analytics tracking, and centralized email infrastructure locks. It provides developers and hosting platforms with a completely autonomous, secure, and independent email relay and inbox storage framework.

## Core Architectural Layers

1. **The MTA Core (Postfix):** Handles high-throughput mail delivery rules, enforcing strict compliance validation parameters on incoming and outgoing network sockets.
2. **The Delivery Layer (Dovecot):** Manages secure local mailbox storage, routing IMAP client synchronization queries with microsecond efficiency directly to consumer devices.
3. **Automated Cryptography:** Integrates flawlessly with `CloudStripper` security hooks to implement mandatory TLS/SSL enforcement across all communication gates.

## Quick Start Configuration

Deploy the stack instantly onto an optimized bare-metal Linux container workspace using the standard deployment engine:

```bash
# Pull and initialize the mail stack layout
docker-compose up -d
```

Review the `config/` directory templates to customize your domain MX records, cryptographic DKIM keys, and virtual user alias files.
