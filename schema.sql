-- 1. Telemetria e integridade de arquivos (AllEyes.py)
CREATE TABLE IF NOT EXISTS file_telemetry (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    filepath TEXT NOT NULL,
    sha256_hash TEXT NOT NULL,
    checked_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    anomaly_detected BOOLEAN DEFAULT 0
);

-- 2. Histórico de execução de efetores locais (Executor.py)
CREATE TABLE IF NOT EXISTS command_logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    exit_code INTEGER NOT NULL,
    output_payload TEXT,
    executed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Perfil de persistência e estado da sessão (AX-MMO-031)
CREATE TABLE IF NOT EXISTS system_state (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- 4. Pontos de restauração e descongelamento (AX-POKA-032)
CREATE TABLE IF NOT EXISTS restore_points (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    checkpoint_name TEXT NOT NULL,
    snapshot_payload TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);