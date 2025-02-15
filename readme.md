Great! 🎉 Since the world loaded correctly in Minecraft, the next step is to **persist the setup** in a documented and reproducible way. We'll do this by creating:

1. **A `docker-compose.yml`-like setup for Podman**
2. **A `README.md` for documentation**
3. **A startup script for easy management**

---

## **1️⃣ Create a `podman-compose`-like Setup**

Even though Podman doesn't use `docker-compose.yml`, we can create a **Podman playbook** using `podman generate kube` to define the container.

Run this command to generate a YAML file from your running container:

```bash
podman generate kube --service minecraft > podman-minecraft.yaml
```

This will create a `podman-minecraft.yaml` file, which you can use to **recreate the container automatically** in the future.

### **How to Use the YAML**

- To **start the container** from YAML:

  ```bash
  podman play kube podman-minecraft.yaml
  ```

- To **remove the container**:

  ```bash
  podman kube down podman-minecraft.yaml
  ```

---

## **2️⃣ Create a `README.md`**

Inside your **Git repo**, create a `README.md` file to document your setup:

````markdown
# Fabric Minecraft Server (Podman)

This project sets up a Fabric-powered Minecraft server using Podman with persistent storage.

## 📌 Features

- **Fabric-based** modding support
- **Persistent world and configurations**
- **Automated container management**
- **Mod support via `/mods` folder**

## 🚀 Installation

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/yourusername/minecraft-server.git
cd minecraft-server
```
````

### 2️⃣ Start the Server

```sh
podman play kube podman-minecraft.yaml
```

### 3️⃣ Stop the Server

```sh
podman kube down podman-minecraft.yaml
```

### 4️⃣ Add Mods

Place `.jar` mod files into the `mods/` directory, then restart the container:

```sh
podman restart minecraft
```

## 🌍 Server Configuration

Modify `server.properties` to change settings like:

- Whitelist
- Spawn protection
- Difficulty
- Online mode

## 📦 Backup Strategy

Run the included script before making changes:

```sh
./backup.sh
```

## 🎮 Connect to the Server

- **Local:** `localhost`
- **Remote:** `your-server-ip:25565`
