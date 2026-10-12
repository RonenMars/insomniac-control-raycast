import { execFile } from "child_process";
import { environment, showHUD } from "@raycast/api";
import { join } from "path";
import { promisify } from "util";

const execFilePromise = promisify(execFile);

export default async function main() {
  try {
    const { stdout } = await execFilePromise("/bin/bash", [
      join(environment.assetsPath, "insomniac-sleep.sh"),
    ]);
    await showHUD(`☕ ${stdout.trim()}`);
  } catch (error) {
    await showHUD("❌ Failed to toggle Insomniac state.");
    console.error(error);
  }
}
