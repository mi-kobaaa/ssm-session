# ssm-session

`ssm-session` is a command-line tool designed to quickly initiate sessions using the AWS Systems Manager Session Manager.
In particular, it offers options to support Windows Remote Desktop.

## Dependencies

- [AWS CLI](https://aws.amazon.com/cli/)
- [Session Manager Plugin](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
- RDP Client: If you intend to use the Windows Remote Desktop options, you will also need an RDP client installed on your machine.

Without these dependencies installed, `ssm-session` will not function properly.

## Installation

Install using Homebrew:

```
brew tap mi-kobaaa/ssm-session
brew install mi-kobaaa/ssm-session/ssm-session
```

Alternatively, you can clone this repository and execute the script directly.

## Usage

Basic usage:

```
ssm-session -t <your_instance_id>
```

To use the options for Windows Remote Desktop:

```
ssm-session -t <your_instance_id> -w
```

To customize the localPortNumber:

```
ssm-session -t <your_instance_id> -w -l <local_port_number>
```

To display all available options:

```
ssm-session --help
```

## Options

- `-t`: Specify the target instance ID.
- `-p`: Specify the AWS profile name.
- `-r`: Specify the AWS region. Default is `ap-northeast-1`.
- `-w`: Enable options for Windows Remote Desktop.
- `-l`: Specify the localPortNumber. Default is `13389`.
