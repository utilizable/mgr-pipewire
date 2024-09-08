# Helm Chart Configuration

This Helm Chart allows for the configuration of PipeWire and WirePlumber through environment variables. Below is a table describing the key configuration options and their default values.

| Variable Name           | Default Value  | Description                                                                 |
|-------------------------|----------------|-----------------------------------------------------------------------------|
| `PIPEWIRE_PORT`          | `4713`         | Specifies the port number used by PipeWire for audio streaming.             |
| `PIPEWIRE_DEBUG`         | `E`            | Sets the debug level for PipeWire. Higher levels provide more detailed logs. |
| `WIREPLUMBER_DEBUG`      | `E`            | Sets the debug level for WirePlumber, providing enhanced logging information.|
| `PIPEWIRE_LATENCY`       | `32/48000`     | Configures audio latency as a fraction. The value is interpreted as `frames/sample rate`. |
| `PIPEWIRE_QUANTUM`       | `1024/48000`   | Configures both the audio buffer size (`quantum`) and sample rate, affecting latency and performance. |

These values can be customized as per your system requirements by modifying the Helm Chart values.
