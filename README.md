## Custom Debian Net Installer Script By i-Sifat(Inspired From Debian-titus)

This repository contains a custom script for automating the installation process of Debian using the net installer. The script draws inspiration from Chris Titus Tech's Debian-titus project. The aim is to simplify and expedite the installation process, making it easy for users to set up a Debian system according to their preferences.

### How to Use

To use this custom installer script, follow the steps below:

1. **Download Debian Net Installer ISO**: Obtain the official Debian net installer ISO image from the [Debian website]([https://www.debian.org/distrib/netinst](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.1.0-amd64-netinst.iso))

2. **Create a Bootable USB Drive**: Use software like Rufus (Windows) or dd/Ventoy (Linux) to create a bootable USB drive with the downloaded Debian net installer ISO.

3. **Clone this Repository**: Clone this repository to your local machine using the following command:
   ```
   git clone https://github.com/i-sifat/debian.git
   ```

4. **Navigate to the Repository Directory**: Use the `cd` command to move into the cloned repository directory:
   ```
   cd debian
   ```

5. **Customize Configuration (Optional)**: Open the `install.sh` script using a text editor and customize the configuration options according to your preferences. These options might include partitioning, user setup, software selection, etc.

6. **Make `install.sh` Executable**: Ensure that the `install.sh` script has executable permissions. If not, grant execute permissions using the following command:
   ```
   chmod +x install.sh
   ```

7. **Run the Installer**: Execute the `install.sh` script using the following command:
   ```
   ./install.sh
   ```

8. **Follow On-screen Prompts**: The script will guide you through the installation process, presenting the choices you've configured and asking for any required information.


### Feedback and Contributions

Feel free to provide feedback, suggestions, or improvements for this custom Debian net installer script. If you encounter any issues or have ideas for enhancing the script, please submit an issue or pull request on this repository.

**Note**: This script is provided as-is and without any warranties. Use it at your own risk, and always review the code to ensure it meets your requirements before using it in a production environment.
