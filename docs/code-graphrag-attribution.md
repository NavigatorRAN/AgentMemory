# CodeGraphRAG Attribution

AgentMemory includes a local, deterministic CodeGraphRAG layer inspired by Microsoft GraphRAG:

- Documentation: https://microsoft.github.io/graphrag/
- Repository: https://github.com/microsoft/graphrag

Microsoft GraphRAG describes a process for loading a corpus, chunking it into analyzable text units, extracting entities and relationships, detecting graph communities, generating community reports, and using those structures for global, local, DRIFT, and basic retrieval modes.

AgentMemory borrows that product concept for local codebase understanding, but this repository does not vendor, copy, or wrap Microsoft GraphRAG code in this slice. The implementation here is a Swift-native, local-first approximation:

1. Scan a repository on disk.
2. Create text units for source and documentation files.
3. Extract symbols, imports, containment, and test relationships.
4. Group files into subsystem communities.
5. Generate wiki pages and Memory MCP-compatible summaries for coding agents.

Microsoft GraphRAG is licensed under the MIT License. If a later slice vendors or directly depends on Microsoft GraphRAG code, preserve the required license notice and re-check the upstream license at that time.
