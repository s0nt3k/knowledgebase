# 📛 What a Naming Convention Is

A naming convention is a standardized method for assigning consistent, predictable, and meaningful names to systems, devices, accounts, files, and documentation. It ensures that every asset in an environment—whether physical, virtual, or procedural—follows the same structured pattern so it can be easily identified, categorized, searched, and managed.

---

## 🖥 **Expanded 15‑Character Hostname Convention**

Your updated hostname format now includes **two additional characters**:

- **1 digit** → system criticality classification  
- **1 letter** → redundancy level  

These appear **after the device type** and before the unique identifier.

---

## 📐 **Final Hostname Structure (15 Characters Total)**

```
CCCC OOOO DD X R IIIII
```

Actual hostname (no spaces):

```
CCCCOOOODDXRIIIII
```

Where:

- **CCCC** = 4‑digit customer HEX ID  
- **OOOO** = 4‑character OS ID  
- **DD** = 2‑character device type  
- **X** = 1‑digit criticality code  
- **R** = 1‑letter redundancy level  
- **IIIII** = 5‑character unique identifier  

---

# 🔢 **Criticality Code (X)**  
A **single digit** representing the system’s operational importance and data sensitivity.

| Code | Classification | Description |
|------|----------------|-------------|
| **0** | Standard Workstation | Non‑critical user workstation; no sensitive data |
| **1** | Sensitive Data System | Handles PII, PHI, financial, or escrow data |
| **2** | Public‑Facing System | Exposed to the internet; hardened perimeter system |
| **3** | Mission‑Critical System | Outage impacts business continuity or compliance |
| **4** | Life‑Safety / Emergency | Reserved for systems protecting life or safety |

---

# 🔁 **Redundancy Level (R)**  
A **single letter** indicating the redundancy architecture of the endpoint.

| Letter | Redundancy Level | Description |
|--------|------------------|-------------|
| **A** | None | No redundancy; single device |
| **B** | Basic | Local backups; no failover |
| **C** | Clustered | HA cluster (2+ nodes) |
| **D** | Distributed | Multi‑site or multi‑region redundancy |
| **E** | Enterprise HA | Full failover + replication + DR site |
| **F** | Fault‑Tolerant | Hot‑hot systems; zero‑downtime architecture |

---

# 🧩 **Examples**

### **Mission‑critical Windows server with enterprise HA**
```
A12FWINSV3E00001
```
Breakdown:
- Customer: A12F  
- OS: WINS  
- Device: SV  
- Criticality: 3 (mission‑critical)  
- Redundancy: E (enterprise HA)  
- ID: 00001  

---

### **Sensitive-data Linux workstation with basic redundancy**
```
C0DELNXWS1B00A42
```

---

### **Public‑facing firewall with distributed redundancy**
```
9B33NETFW2D01DB2
```

---

# 📘 **Complete Legend**

## **Customer HEX ID (CCCC)**  
4‑digit hexadecimal identifier  
Examples: `A12F`, `C0DE`, `9B33`, `0FAB`

---

## **Operating System ID (OOOO)**  
4‑character OS code  
Examples:  
- Windows: `WINW`  
- Windows Server: `WINS`  
- Linux: `LNXG`  
- Ubuntu: `UBNT`  
- macOS: `MACO`  
- ESXi: `ESXI`  
- Network OS: `NETO`  

---

## **Device Type (DD)**  
2‑character device category  
Examples:  
- Workstation: `WS`  
- Laptop: `LT`  
- Server: `SV`  
- Firewall: `FW`  
- Switch: `SW`  
- Access Point: `AP`  
- VM: `VM`  

---

## **Criticality Code (X)**  
Single digit  
- 0 = Standard workstation  
- 1 = Sensitive data system  
- 2 = Public‑facing system  
- 3 = Mission‑critical  
- 4 = Life‑safety  

---

## **Redundancy Level (R)**  
Single letter  
- A = None  
- B = Basic  
- C = Clustered  
- D = Distributed  
- E = Enterprise HA  
- F = Fault‑tolerant  

---

## **Unique Identifier (IIIII)**  
5‑character alphanumeric  
Examples: `00001`, `A1023`, `SRV01`, `DB001`

---

# 🧭 Want me to generate a **validation regex**, **hostname generator script**, or a **quick‑reference sheet** for this convention?

Choose one:

- **Hostname validation regex**  
- **Hostname quick‑reference sheet**  
- **Hostname generator script**
