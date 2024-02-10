import subprocess
import socket

def resolve_dns(hostname):
    try:
        ipv4_address = socket.gethostbyname(hostname)
        return ipv4_address
    except socket.gaierror as e:
        print(f"Error resolving DNS: {e}")
        return None

def run_command(ipv4):
    command = f"wg-tcp-tunnel --src-udp=0.0.0.0:51869 --dst-tcp={ipv4}:443"
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return process

def main():
    hostname = "casa-resgatados.dynip.sapo.pt"  # Change this to your DNS hostname
    ipv4 = resolve_dns(hostname)
    if ipv4:
        process = run_command(ipv4)
        # Monitor the command's output
        while True:
            output = process.stderr.readline().strip()
            if output:
                print(output)
                if "broken pipe" in output.lower():
                    print("Restarting script due to broken pipe...")
                    process.terminate()  # Terminate the command process
                    process = run_command(ipv4)  # Restart the command
            else:
                break  # Break the loop when no more output
    else:
        print("Failed to resolve DNS. Exiting.")

if __name__ == "__main__":
    main()
