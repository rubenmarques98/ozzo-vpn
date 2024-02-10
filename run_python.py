import subprocess
import socket
import select
import time

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
        last_positive_message_time = time.time()
        # Monitor the command's output
        while True:
            # Check if there's any data available to read
            ready = select.select([process.stderr], [], [], 0.1)[0]
            if ready:
                output = process.stderr.readline().strip()
                if output:
                    print(output)
                    if "broken pipe" in output.lower():
                        print("Restarting script due to broken pipe...")
                        process.terminate()  # Terminate the command process
                        process = run_command(ipv4)  # Restart the command
            else:
                # Print a positive message every 10 seconds
                if time.time() - last_positive_message_time >= 30:
                    print("The VPN is working fine.")
                    last_positive_message_time = time.time()
    else:
        print("Failed to resolve DNS. Exiting.")

if __name__ == "__main__":
    main()
